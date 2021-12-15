*** Settings ***
Library           ExtendedSelenium
Library           RPA.Robocorp.Vault

*** Tasks ***
Minimal task
    [Teardown]    Close All Browsers
    ${secrets}=    Get Secret    lastpass
    Open Available Browser    about:blank    browser_selection=Firefox    headless=${TRUE}
    Firefox Install Addon    %{ROBOT_ROOT}${/}lastpass_password_manager-4.85.1.3-an+fx.xpi    ${TRUE}
    Sleep    10s
    Switch Window    NEW
    Wait Until Element Is Visible    id:webclient
    Select Frame    id:webclient
    Click Element    //button[@data-automation-id="accept-permission-button"]
    Screenshot    filename=${OUTPUTDIR}${/}pre_login.png
    Input Text    //input[@name="username"]    ${secrets}[lastpass_username]
    Input Password    //input[@name="password"]    ${secrets}[lastpass_password]
    Click Element    //button[@type="submit"]
    Sleep    5s
    Screenshot    filename=${OUTPUTDIR}${/}logged_in.png
    Log    Done.

*** Comments ***
# Basic Pseudo code to handle email verification
# install Last Pass extension
# login with extension
# login was blocked ?
## check email for "login attempt blocked" email
## verify new device / location button (by HTTP request)
## retry login
# Done
