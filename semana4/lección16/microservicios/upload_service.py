from flask import Flask, request, redirect, url_for, flash
import os

UPLOAD_FOLDER = '/uploads'
ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        # Verificar si en la petición POST tenemos fichero
        if 'file' not in request.files:
            flash('Sin fichero en la petición')
            return redirect(request.url)
        file = request.files['file']
        # Si el usuario no proporciona fichero, el navegador crea un fichero vacio sin nombre
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = file.filename
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            return f'Fichero {filename} subido con éxito'
    return '''
    <!doctype html>
    <title>Subir nuevos ficheros</title>
    <h1>Seleccionar fichero</h1>
    <form method=post enctype=multipart/form-data>
      <input type=file name=file>
      <input type=submit value=Upload>
    </form>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
