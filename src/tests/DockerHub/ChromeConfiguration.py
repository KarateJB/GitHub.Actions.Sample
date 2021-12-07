from selenium.webdriver.chrome.options import Options

def config():
    options = Options()
    options.add_argument('--headless')
    # options.add_argument('--disable-infobars')
    # options.add_argument('--disable-extensions')
    options.add_argument("--no-sandbox")
    options.add_argument('--disable-gpu')
    options.add_argument('--disable-dev-shm-usage')
    # options.add_argument('--whitelisted-ips')
    options.add_argument("--window-size=1920,1080")
    options.add_argument('--log-level=ALL')
    # options.add_argument('--user-data-dir=/tmp')
    # options.add_argument('--remote-debugging-port=9222')
    # options.add_argument('--disable-features=VizDisplayCompositor')
    return options

def serviceargs():
    return ["--verbose", "--log-path=/var/log/chromedriver.log"]