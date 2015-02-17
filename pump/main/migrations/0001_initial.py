# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Response',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('added', models.DateTimeField(auto_now_add=True)),
                ('q1', models.TextField(default=b'', blank=True)),
                ('q2', models.TextField(default=b'', blank=True)),
                ('q3', models.TextField(default=b'', blank=True)),
                ('q4', models.TextField(default=b'', blank=True)),
                ('q5', models.TextField(default=b'', blank=True)),
                ('q6', models.TextField(default=b'', blank=True)),
                ('q7', models.TextField(default=b'', blank=True)),
                ('q8', models.TextField(default=b'', blank=True)),
                ('q9', models.TextField(default=b'', blank=True)),
                ('q10', models.TextField(default=b'', blank=True)),
                ('q11', models.TextField(default=b'', blank=True)),
                ('q12', models.TextField(default=b'', blank=True)),
                ('q13', models.TextField(default=b'', blank=True)),
                ('q14', models.TextField(default=b'', blank=True)),
                ('q15', models.TextField(default=b'', blank=True)),
                ('q16', models.TextField(default=b'', blank=True)),
                ('q17', models.TextField(default=b'', blank=True)),
                ('q18', models.TextField(default=b'', blank=True)),
                ('q19', models.TextField(default=b'', blank=True)),
                ('q20', models.TextField(default=b'', blank=True)),
                ('q21', models.TextField(default=b'', blank=True)),
                ('q22', models.TextField(default=b'', blank=True)),
                ('q23', models.TextField(default=b'', blank=True)),
                ('q24', models.TextField(default=b'', blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
