from splinter import Browser

# change this to True and you will get dumped into
# an ipdb shell when a step fails. Good for debugging.
# remember to set it back to False before this goes to travis
# though...
BEHAVE_DEBUG_ON_ERROR = False


def before_all(context):
    context.browser = Browser('firefox')

    def browser_url(url):
        return context.base_url + url

    context.browser_url = browser_url


def after_all(context):
    context.browser.quit()


def before_scenario(context, scenario):
    pass


def after_scenario(context, scenario):
    pass


def after_step(context, step):
    if BEHAVE_DEBUG_ON_ERROR and step.status == "failed":
        import ipdb
        ipdb.post_mortem(step.exc_traceback)
