from flask import Flask, redirect, render_template,request, url_for, flash, make_response, send_file
from io import BytesIO
from flask_mysqldb import MySQL
import pickle
import pandas as pd
import tempfile

# Connect to Database
app = Flask(__name__)
app.secret_key = 'your_secret_key'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'welding'
mysql = MySQL(app)

# load model
with open('model.pkl', 'rb') as file:
    model = pickle.load(file)


@app.route('/', methods=['POST', 'GET'])
def login():
    # Mengambil cookie 'username'
    cookie = request.cookies.get('username')

    # Pengecekan apakah cookie ada dan valid
    if cookie:
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM tb_user WHERE username = %s", (cookie,))
        user_cookie = cursor.fetchone()
        cursor.close()

        if user_cookie:
            return redirect(url_for('solo'))

    # Jika cookie tidak ditemukan, periksa apakah method POST digunakan untuk login
    if request.method == "POST":
        # Ambil data dari form
        username = request.form['username']
        password = request.form['password']

        # Query ke database untuk cek username dan password
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM tb_user WHERE username = %s AND password = %s", (username, password))
        user = cursor.fetchone()
        cursor.close()

        # Cek apakah user ditemukan
        if user:
            resp = make_response(redirect(url_for('solo')))  # Redirect ke halaman 'solo'
            resp.set_cookie('username', username)  # Set cookie 'username'
            return resp
        else:
            flash("Username atau password salah!", "error")
            return render_template('index.html')
    else:
        # Tampilkan halaman login jika request method bukan POST
        return render_template('index.html')
    
    

@app.route('/solo')
def solo():
    cookie = request.cookies.get('username')
    if cookie:
        cursor = mysql.connection.cursor()
        # Query ke database untuk mencari user berdasarkan cookie username
        cursor.execute("SELECT * FROM tb_user WHERE username = %s", (cookie,))
        user_cookie = cursor.fetchone()
        cursor.execute("SELECT * FROM tbl_schedule")
        schedules = cursor.fetchall()
        cursor.execute("SELECT * FROM tbl_component1")
        component1 = cursor.fetchall()
        cursor.execute("SELECT * FROM tbl_component2")
        component2 = cursor.fetchall()

        if user_cookie:
            return render_template('dashboard.html', schedules=schedules, component1 = component1, component2 = component2)
        else:
            return render_template('index.html')
   
        
    else:
        return render_template('index.html')


@app.route("/predict", methods=["GET", "POST"])
def predict():

    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM tbl_schedule")
    schedules = cursor.fetchall()
    cursor.execute("SELECT * FROM tbl_component1")
    component1 = cursor.fetchall()
    cursor.execute("SELECT * FROM tbl_component2")
    component2 = cursor.fetchall()

    # Ambil data dari form
    size = float(request.form.get('Size'))
    component_1 = request.form.get('Component1')
    component_2 = request.form.get('Component2')
    Schedule = request.form.get('Schedule')

    # input_data = [6.0, '40S', 'PIPE', 'FLANGE']

    input_data = {
    'Size': size,
    'Schedule': Schedule,
    'COMPONENT1': [component_1],
    'COMPONENT2': [component_2],
}

    # Konversi input_data menjadi array NumPy (jika model mengharapkannya)
    input_data = pd.DataFrame(input_data)

    X_train = pd.read_excel('kolom.xlsx')
    df_baru_encoded  = pd.get_dummies(input_data)
    df_baru_encoded = df_baru_encoded.reindex(columns=X_train.columns, fill_value=0)
    # Buat prediksi menggunakan model
    prediction = model.predict(df_baru_encoded)[0]
    dummy_pred_proba = model.predict_proba(df_baru_encoded)
    F = (dummy_pred_proba[:, 0] * 100).round(2)[0]  # Probabilitas untuk kelas F dalam persen
    S = (dummy_pred_proba[:, 1] * 100).round(2)[0]

    cursor.execute(
        "INSERT INTO tb_welding (date, size, component1, component2, schedule, predict, S , F) VALUES (NOW(), %s, %s, %s, %s, %s, %s, %s);",
        (size, component_1, component_2, Schedule, prediction, S, F)
    )

    # Commit perubahan ke database
    mysql.connection.commit()
    cursor.close()
    
    # Buat response
    return render_template("dashboard.html",schedules=schedules, component1 = component1, component2 = component2, F = F, S = S, component_1 = component_1, component_2 = component_2, size = size, Schedule = Schedule, prediction="{}".format(prediction))

@app.route('/multi')
def multi():
    cookie = request.cookies.get('username')
    if cookie:
        # Query ke database untuk mencari user berdasarkan cookie username
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM tb_user WHERE username = %s", (cookie,))
        user_cookie = cursor.fetchone()
        cursor.close()

        if user_cookie:
            return render_template('multi.html')
        else:
            return render_template('index.html')
     
    else:
        return render_template('index.html')

# @app.route('/multipred', methods=['POST'])
# def multipred():
#     cookie = request.cookies.get("username")
#     if cookie:
#         cursor = mysql.connection.cursor()
#         cursor.execute("SELECT * FROM tb_user WHERE username = %s", (cookie,))
#         user_cookie = cursor.fetchone()
#         cursor.close()
#         X_train = pd.read_excel('kolom.xlsx')

#         if user_cookie:
#             upload = request.files.get('upload')
#             data = pd.read_excel(upload)
#             encode = pd.get_dummies(data)
#             reindex = encode.reindex(columns=X_train.columns, fill_value=0)
#             prediction = model.predict(reindex)
#             data['Location'] = prediction
#             dummy_pred_proba = model.predict_proba(reindex)

#             # Tampilkan probabilitas masing-masing kelas sebagai persentase
#             for i, prob in enumerate(dummy_pred_proba[0]):
#                 if i == 0:
#                     data['F'] = prob * 100
#                     print(f"Probabilitas F: {prob * 100:.2f}%")
#                 else:
#                     data['S'] = prob * 100
#                     print(f"Probabilitas S: {prob * 100:.2f}%")

#             # menggubah dataframe ke excel
#             data.to_excel('predict.xlsx', index=False)
#             return send_file('predict.xlsx', as_attachment=True)
            
#         else:
#             return render_template('index.html')
     
#     else:
#         return render_template('index.html')
    

@app.route('/multipred', methods=['POST'])
def multipred():
    cookie = request.cookies.get("username")
    if cookie:
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM tb_user WHERE username = %s", (cookie,))
        user_cookie = cursor.fetchone()
        cursor.close()

        if user_cookie:
            upload = request.files.get('upload')
            if upload:
                data = pd.read_excel(upload)
                X_train = pd.read_excel('kolom.xlsx')
                encode = pd.get_dummies(data)
                reindex = encode.reindex(columns=X_train.columns, fill_value=0)

                # Prediksi lokasi
                prediction = model.predict(reindex)
                data['Location'] = prediction

                # Probabilitas prediksi
                dummy_pred_proba = model.predict_proba(reindex)
                data['F (%)'] = (dummy_pred_proba[:, 0] * 100).round(2)  # Probabilitas untuk kelas F dalam persen
                data['S (%)'] = (dummy_pred_proba[:, 1] * 100).round(2)  # Probabilitas untuk kelas S dalam persen

                # Simpan ke file excel sementara
                with tempfile.NamedTemporaryFile(delete=False, suffix='.xlsx') as tmp:
                    temp_path = tmp.name
                data.to_excel(temp_path, index=False)

                return send_file(temp_path, as_attachment=True, download_name="predict.xlsx")
            else:
                return "Please upload a file", 400  # Status 400 untuk error
        else:
            return render_template('index.html')
    else:
        return render_template('index.html')



@app.route('/history')
def history():
    cookie = request.cookies.get('username')
    if cookie:
        # Query ke database untuk mencari user berdasarkan cookie username
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM tb_user WHERE username = %s", (cookie,))
        user_cookie = cursor.fetchone()

        cursor.execute("SELECT * FROM tb_welding")
        welding = cursor.fetchall()
        cursor.close()

        if user_cookie:
            return render_template('history.html', welding = welding)
        else:
            return render_template('index.html')
   
        
    else:
        return render_template('index.html')

@app.route('/download')
def download():
    cookie = request.cookies.get('username')
    if cookie:
        # Query ke database untuk mencari user berdasarkan cookie username
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM tb_user WHERE username = %s", (cookie,))
        user_cookie = cursor.fetchone()
        
        if user_cookie:
            cursor.execute("SELECT * FROM tb_welding")
            welding = cursor.fetchall()
            cursor.close()  # Tutup cursor setelah selesai digunakan

            # Konversi hasil query ke DataFrame
            welding_df = pd.DataFrame(welding, columns=['no', 'date', 'size', 'component1', 'component2', 'schedule', 'predict', 'S', 'F'])
            
            # Membuat file Excel dalam memory
            output = BytesIO()
            with pd.ExcelWriter(output, engine='xlsxwriter') as writer:
                welding_df.to_excel(writer, index=False, sheet_name='History Welding')

            # Menyiapkan respons untuk mengunduh file
            response = make_response(output.getvalue())
            response.headers["Content-Disposition"] = "attachment; filename=History_Welding.xlsx"
            response.headers["Content-type"] = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
            return response
        
        else:
            cursor.close()  # Tutup cursor sebelum mengembalikan halaman
            return render_template('index.html')
    else:
        return render_template('index.html')

@app.errorhandler(404)
def page_not_found(error):
    return render_template('error.html'), 404

@app.route('/go-back')
def go_back():
    return redirect(request.referrer or url_for('index'))

@app.route('/logout')
def logout():
    resp = make_response(render_template('index.html'))
    resp.delete_cookie('username')
    return resp

if __name__ == "__main__":
    app.run(debug=True, port=5001)

