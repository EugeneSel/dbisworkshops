"""
Create templates for Database generation and Excel file entities
"""
from flask import Flask, redirect, url_for, render_template, abort, request
app = Flask(__name__)

@app.route('/api/<name>')
def index(name):
    if name == 'dbgeneration':
        return render_template('index_db.html')
    elif name == 'excel':
        return render_template('index_excel.html')
    elif name == 'all':
        return render_template('all.html', result_db = result_db, result_excel = result_excel)
    else:
        abort(404, 'Avaliable path values: /all, /dbgeneration, /excel. You entered: %s' %name)

@app.route('/local_db', methods = ['POST', 'GET'])
def db():
    if request.method == 'POST':
        global result_db
        result_db = request.form
        return render_template('db.html', result = result_db)

@app.route('/local_excel', methods=['POST', 'GET'])
def excel():
    if request.method == 'POST':
        global result_excel
        result_excel = request.form
        return render_template('excel.html', result = result_excel)

if __name__ == "__main__":
    app.run(debug = True)
