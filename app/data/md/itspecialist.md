import Programming
import Linux
import Internet
import Security

class ItSpecialist:
    '''IT Specialist makes Future.'''

    def __init__(self):
        self.Skill = []
        self.programming()
        self.os()
        self.security()


    def security(self):
        self.Skill.append(Security.seaj)
        self.Skill.append(Internet.ciw)
        self.Skill.append(Internet.cloud)

    def os(self):
        self.Skill.append(Linux.commands)
        self.Skill.append(Linux.serverbuild)

    def programming(self):
        self.Skill.append(Programming.python)
        self.Skill.append(Programming.Java)
        self.Skill.append(Programming.JavaScript)
        self.Skill.append(Programming.AndroidApplication)
        self.Skill.append(Programming.database)
