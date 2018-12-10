from flask_wtf import Form
from wtforms import TextField, StringField, IntegerField, TextAreaField, SubmitField, RadioField, SelectField, \
    PasswordField
from flask import Flask, render_template, request, flash
from wtforms import validators, ValidationError


class ExcelForm(Form):
    file_name = StringField("Excel file name", [validators.DataRequired("Please, enter file name.")])

    cell_address = StringField("Cell Address", [validators.DataRequired("Please, enter cell address.")])

    cell_data = StringField("Cell Data", [validators.DataRequired("Please, enter the data you need.")])

    cell_type = StringField("Cell Type", [validators.DataRequired("Please, enter the type of data you need.")])

    operation = RadioField("Type of operation", choices=[('U', 'Update'), ('A', 'Add'), ('D', 'Delete')])

    submit = SubmitField("Let`s go")