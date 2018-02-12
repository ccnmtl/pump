class Houghton(object):
    """ Houghton PASS is 8 or greater (out of possible 18) """
    def __init__(self, responses):
        self.responses = responses

    def score(self):
        return sum(self.responses)

    def pass_fail(self):
        return self.score() >= 8

    def category(self):
        categories = [
            "independent community walking",
            "limited community/independent household walking",
            "limited household walking",
        ]
        if self.score() >= 9:
            return categories[0]
        elif self.score() >= 6:
            return categories[1]
        return categories[2]


class ABC(object):
    """ ABC PASS is 66% or greater
    (out of possible 160, using 10pt scale for each of
    the 16 questions, averaged) (which should be 66% or greater) """
    def __init__(self, responses):
        self.responses = responses

    def score(self):
        return int((sum(self.responses) / 160.0) * 100)

    def pass_fail(self):
        return self.score() >= 66


class PassFail(object):
    def __init__(self, response):
        self.response = response

    def pass_fail(self):
        return self.response == 2
