from behave import given


def advance(context):
    for button in context.browser.find_by_css('ul.pager a'):
        if button.text == "Next >" and button.visible:
            button.click()
            return


def fill_in_minimum(context):
    context.browser.choose('q1', '1')
    context.browser.choose('q2', '1')
    context.browser.choose('q3', '1')
    context.browser.choose('q4', '1')
    context.browser.choose('q5', '1')
    context.browser.choose('q6', '1')
    advance(context)
    # ABCs default to 0
    advance(context)
    context.browser.choose('q23', '1')
    advance(context)
    context.browser.choose('q24', '1')
    advance(context)


def goto_survey(context):
    context.browser.visit(context.browser_url("/"))


def submit_survey(context):
    context.browser.find_by_id('submit-button').first.click()


@given(u'I am on the survey')
def i_am_on_the_survey(context):
    context.browser.visit(context.browser_url("/"))
