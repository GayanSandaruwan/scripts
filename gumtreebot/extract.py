from   selenium import webdriver
from   selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait

browser = webdriver.Chrome()
browser = webdriver.Chrome(executable_path=r'E:\CiperLabs\fiver\scripts\gumtreebot\chromedriver.exe')
browser.get("https://my.gumtree.com/login")

wait = WebDriverWait( browser, 5 )

username = browser.find_element_by_name("username")
password = browser.find_element_by_name("password")

submit = browser.find_element_by_xpath("//*[@id='login-form']/div/form/fieldset/div[3]/button")

username.send_keys("Starsuperin2012@me.com")
password.send_keys("J3nnif3r")

wait = WebDriverWait( browser, 5 )

submit.click()
