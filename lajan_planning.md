# Lajan Mache Project Plan

#### Name:          Lajan Mache

#### Tech Stack
* Ruby 3.1
* Rails 7
* PostgreSQL
* Gems Used:
  * Annotate
  * Better Errors
  * Binding of Caller
  * Devise
  * Hirb
  * Hotwire LiveReload
  * Letter Opener
  * Rspec
  * SmithViewTool

#### Design
* Users:            common users, subscribed users, admin users
* Accounts:         Users are able to manage funds in multiple accounts, allowing for varying strategies/planning
* Account Holdings: connects Accounts with Company data available
* Company:          Actual companies listing
* Price History:    Company historical Pricings
* Dividend History: Company next and historical Dividend offerings, to include the declaration date, exdividend date, record date, and payment date

#### TODOS
* Authentication
* User Profile
* Create an Account
* Add Company to Account
* Create Account Dashboard
  * Show Account Balance
    * Show Dividends Received
  * Show Account Change
  * Show Projected Annual Dividend
  * Show Dividend increase since purchase
  * Add Number of Shares (owned/ to own)
  * Show limited Company Data on Account Dashboard
* Calculate expected Monthly/ Annual Dividend Payout
* Show Company Data on Company page


* dashboard updates based on the account being viewed, also have a grand account dashboard
* Add new account (needs parameters permitted)
* Show contents of account in the dashboard
* add new holdings to current account
