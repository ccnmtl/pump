from behave import when, then, given
from django.core import mail
from .common import (fill_in_minimum, submit_survey, goto_survey)


@given(u'I have completed a survey')
def i_have_completed_a_survey(context):
    goto_survey(context)
    fill_in_minimum(context)
    submit_survey(context)


@when(u'I enter "{address}" in the email field')
def i_enter_an_address_in_the_email_field(context, address):
    context.browser.fill('email', address)
    context.browser.find_by_id('email-button').click()


@then(u'an email is sent to "{address}"')
def an_email_is_sent_to(context, address):
    assert len(mail.outbox) == 1
    assert address in mail.outbox[0].to
