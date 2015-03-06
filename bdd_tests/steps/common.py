from behave import given


@given(u'I am on the survey')
def i_am_on_the_survey(context):
    context.browser.visit(context.browser_url("/"))
