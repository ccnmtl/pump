from behave import when, then, given
from .common import (
    advance, fill_in_minimum, fill_in_minimum_houghton,
    fill_in_minimum_balance_1,  fill_in_minimum_balance_2)


@then(u'I see the header "{text}"')
def i_see_the_header(context, text):
    assert context.browser.is_text_present(text, wait_time=2)


@then(u'I see the text "{text}"')
def i_see_the_text(context, text):
    assert context.browser.is_text_present(text, wait_time=2)


@then(u'I see a "{text}" button')
def i_see_a_button(context, text):
    for b in context.browser.find_by_css('ul.pager a'):
        if b.visible and b.text.startswith(text):
            return
    assert False


@when(u'I click the "{text}" button')
def i_click_the_button(context, text):
    for button in context.browser.find_by_css('ul.pager a'):
        if button.text == text and button.visible:
            button.click()
            return


@given(u'I have advanced to the end')
def i_have_advanced_to_the_end(context):
    fill_in_minimum(context)


@when(u'I advance through the wizard')
def i_advance_through_the_wizard(context):
    advance(context)


@when(u'I reverse through the wizard')
def i_reverse_through_the_wizard(context):
    i_click_the_button(context, "< Previous")


@when(u'I fill in the Houghton questions')
def i_fill_in_the_houghton_questions(context):
    fill_in_minimum_houghton(context)


@when(u'I fill in the Balance 1 questions')
def i_fill_in_the_balance_1_questions(context):
    fill_in_minimum_balance_1(context)


@when(u'I fill in the Balance 2 questions')
def i_fill_in_the_balance_2_questions(context):
    fill_in_minimum_balance_2(context)


@then(u'the "{text}" button is disabled')
def the_button_is_disabled(context, text):
    for b in context.browser.find_by_css('ul.pager a'):
        if b.visible and b.text.startswith(text):
            return b['disabled']
    assert False


@then(u'the "{text}" button is enabled')
def the_button_is_enabled(context, text):
    for b in context.browser.find_by_css('ul.pager a'):
        if b.visible and b.text.startswith(text):
            print(str(b['disabled']))
            return not b['disabled']
    assert False
