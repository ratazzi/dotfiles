#Code  UUID = '9301d536-860d-11de-81c8-0023dfaa9e40'
import sys
try:
        import readline
except ImportError:
        try:
                import pyreadline as readline
        # throw open a browser if we fail both readline and pyreadline
        except ImportError:
                import webbrowser
                webbrowser.open("http://ipython.scipy.org/moin/PyReadline/Intro#line-36")
                # throw open a browser
        #pass
else:
        import rlcompleter
        if sys.platform == 'darwin' and sys.version_info[0] == 2:
                readline.parse_and_bind ("bind ^I rl_complete")
        else:
                readline.parse_and_bind("tab: complete")

