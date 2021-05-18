import time
from time import sleep
from unittest import TestCase
from selenium import webdriver

from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.wait import WebDriverWait
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.action_chains import ActionChains

import config

class TestVotePage(TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = webdriver.Chrome(ChromeDriverManager().install())
        cls.driver.get(config.server)
        time.sleep(3)


    @classmethod
    def tearDownClass(cls):
        cls.driver.close()
        cls.driver.quit()


    def test01_page_title(self):
        self.assertEqual("Sample App",self.driver.title)
        # assert True

    def test02_form_elements_present(self):
        self.assertTrue(self.driver.find_element_by_link_text("View or Add Employees Details here!"))
        
