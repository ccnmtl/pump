from behave import when, then


@when(u'I access the url "{url}"')
def i_access_the_url(context, url):
    context.browser.visit(context.browser_url(url))


@then(u'I get a 200')
def i_get_a_200(context):
    assert context.browser.status_code == 200
