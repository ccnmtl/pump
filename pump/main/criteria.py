class Houghton(object):
    """ Houghton PASS is 8 or greater (out of possible 18) """
    def __init__(self, responses):
        self.responses = responses

    def score(self):
        return sum(self.responses)

    def pass_fail(self):
        return self.score() >= 8


class ABC(object):
    """ ABC PASS is 105 or greater
    (out of possible 160, using 10pt scale for each of
    the 16 questions) (which should be 66% or greater) """
    def __init__(self, responses):
        self.responses = responses

    def score(self):
        return sum(self.responses)

    def pass_fail(self):
        return self.score() >= 105


class PassFail(object):
    def __init__(self, response):
        self.response = response

    def pass_fail(self):
        return self.response == 2
