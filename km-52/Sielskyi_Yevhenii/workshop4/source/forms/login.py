from flask_wtf import Form
from wtforms import TextField, StringField, IntegerField, TextAreaField, SubmitField, RadioField, SelectField, \
    PasswordField
from flask import Flask, render_template, request, flash
from wtforms import validators, ValidationError


class LoginForm(Form):
    login = StringField("User`s Login", [validators.DataRequired("Please, enter your login."),
                                         validators.Length(8, 20, "Login consists of minimum 8 symbols, maximum - 20")])

    password = PasswordField("User`s Password", [validators.DataRequired("Please, enter your password."),
                                                 validators.Length(8, 20, "Password consists of minimum 8 symbols, maximum - 20")])

    submit = SubmitField("Sign in")