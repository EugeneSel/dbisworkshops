from flask import Flask, render_template, request, flash, session, url_for, redirect, make_response
from forms.registration import RegForm
from forms.login import LoginForm
from forms.work_with_excel_file import ExcelForm
from dao.functions_for_user import *
from datetime import datetime, timedelta

app = Flask(__name__)
app.secret_key = 'development key'


@app.route('/', methods=['POST', 'GET'])
def index():
    form = ExcelForm()

    fileList = getExcelFileList()
    if request.method == 'POST':
        if not form.validate():
            login = session['login']
            return render_template('index.html', form=form, login=login, is_exist='')
        else:
            login = session['login']
            is_exist = False
            for file in fileList:
                if file[0] == request.form['file_name']:
                    is_exist = True
                    break

            if is_exist:
                if request.form['operation'] == 'U':
                    file_name = updateData(
                        request.form['file_name'],
                        request.form['cell_address'],
                        request.form['cell_data']
                    )
                elif request.form['operation'] == 'D':
                    file_name = updateData(
                        request.form['file_name'],
                        request.form['cell_address']
                    )
                elif request.form['operation'] == 'A':
                    file_name = addData(
                        request.form['file_name'],
                        request.form['cell_address'],
                        request.form['cell_data'],
                        request.form['cell_type']
                    )
                return render_template('index.html', form=form, login=login, is_exist='%s successfully changed' % file_name)
            else:
                return render_template('index.html', form=form, login=login, is_exist='current excel file does not exist.')
    else:
        if 'login' in session:
            login = session['login']
            if login is None:
                return "<div>You are not logged in <br><a href = '/login'></b>" + "Click here to log in</b></a><br>" + \
                       "<a href='/registration'></b>Or here to create an account</b></a></div>"
            return render_template('index.html', form=form, login=login, is_exist='')
        else:
            login = request.cookies.get('login')
            session['login'] = login
            if login is None:
                return "<div>You are not logged in <br><a href = '/login'></b>" + "Click here to log in</b></a><br>" + \
                       "<a href='/registration'></b>Or here to create an account</b></a></div>"
            else:
                return render_template('index.html', form=form, login=login, is_exist='')


@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()

    userList = getUserList()

    if request.method == 'POST':
        if not form.validate():
            return render_template('login.html', form=form, is_exist='')
        else:
            is_exist = False
            for user in userList:
                if user[0] == request.form['login']:
                    is_exist = True
                    break

            if is_exist:
                session['login'] = request.form['login']
                response = make_response(redirect(url_for('index')))
                expires = datetime.now()
                expires += timedelta(weeks=10)
                response.set_cookie('login', request.form['login'], expires=expires)
                return response
            else:
                return render_template('login.html', form=form, is_exist='User with current login does not exists.')
    else:
        if 'login' in session:
            return render_template('login.html', form=form, is_exist='')
        else:
            login = request.cookies.get('login')
            session['login'] = login
            if login is None:
                return render_template('login.html', form=form, is_exist='')
            else:
                return redirect(url_for('index'))


@app.route('/registration', methods=['GET', 'POST'])
def registration():
    form = RegForm()

    userList = getUserList()
    if request.method == 'POST':
        if not form.validate():
            return render_template('registration.html', form=form, is_unique='')
        else:
            is_unique = True
            for user in userList:
                if user[0] == request.form['login']:
                    is_unique = False
                    break

            if not is_unique:
                return render_template('registration.html', form=form, is_unique='User with current login already exists.')
            else:
                user_login = regUser(
                    request.form['login'],
                    request.form['password'],
                    request.form['email']
                )

                session['login'] = user_login
                response = make_response(redirect(url_for('index')))
                expires = datetime.now()
                expires += timedelta(weeks=10)
                response.set_cookie('login', user_login, expires=expires)
                return response

    return render_template('registration.html', form=form, is_unique='')


@app.route('/logout')
def logout():
    session.pop('login', None)
    response = make_response(redirect(url_for('index')))
    response.set_cookie('login', '', expires=0)
    return response


if __name__ == '__main__':
    app.run(debug=True)
