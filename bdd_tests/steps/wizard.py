from behave import when, then, given


@given(u'I am on the survey')
def impl(context):
    context.browser.visit(context.browser_url("/"))


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
    i_click_the_button(context, "Next >")
    i_click_the_button(context, "Next >")
    i_click_the_button(context, "Next >")
    i_click_the_button(context, "Next >")
    i_click_the_button(context, "Next >")


@when(u'I advance through the wizard')
def i_advance_through_the_wizard(context):
    i_click_the_button(context, "Next >")


@when(u'I reverse through the wizard')
def i_reverse_through_the_wizard(context):
    i_click_the_button(context, "< Previous")
