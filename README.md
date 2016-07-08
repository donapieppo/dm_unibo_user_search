# DmUniboUserSearch

Search in Directory Servicea.
In Unibo we use savon as SOAP client.

## Installation

Add this line to your application's Gemfile:

    gem 'dm_unibo_user_search'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dm_unibo_user_search

Create the file
`/etc/dm_unibo_user_search/soap_conf.yml`

with something like

```yml
dm_unibo_user_search:
  url: 'https://dsa-ws01.example.com/DSASearch/DSASearch.asmx'
  wsdl: '/etc/unibo/DSASearch.wsdl.xml'
  username: username@example.com
  password: real_password_very_secure
```

Actually the library deals only with soap directory services
but can be easily expanded.

## Usage

try with ./bin/dm_unibo_user_search.rb name surname

