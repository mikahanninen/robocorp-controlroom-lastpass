from RPA.Browser.Selenium import Selenium
from SeleniumLibrary.base import keyword

class ExtendedSelenium(Selenium):

    def __init__(self, *args, **kwargs):
        Selenium.__init__(self, *args, **kwargs)

    @keyword
    def looking_at_element(self, locator):
        element = self.get_webelement(locator)
        self.logger.warn(dir(element))

    @keyword
    def firefox_install_addon(self, path, temporary=None):
        # Usage: driver.install_addon('/path/to/firebug.xpi')
        # ‘self’ refers to the “Webdriver” class
        # 'path' is absolute path to the addon that will be installed
        payload = {"path": path}
        if temporary:
            payload["temporary"] = temporary
        # The function returns an identifier of the installed addon.
        # This identifier can later be used to uninstall installed addon.
        return self.driver.execute("INSTALL_ADDON", payload)