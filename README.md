# petouto

The plugin-wielding, multi-purpose Telegram bot.

Public bot runs on [@petoutobot](http://telegram.me/petoutobot).

To start, send "/start" or say "Hello, petouto."


##Plugins

<table>
  <thead>
    <tr>
      <td>/help</td>
      <td>List commands</td>
    </tr>
    <tr>
      <td>/cid</td>
      <td>Current chat id</td>
    </tr>
    <tr>
      <td>/who</td>
      <td>Your uid or reply</td>
    </tr>
    <tr>
      <td>/send <cid> <message></td>
      <td>Send msg to cid (only owner)</td>
    </tr>
    <tr>
      <td>/kick <uid> or reply</td>
      <td>Kick a user (only owner)</td>
    </tr>
    <tr>
      <td>/unban <uid> or reply</td>
      <td>Unban a user</td>
    </tr>
    <tr>
      <td>/echo <text></td>
      <td>Echo a text</td>
    </tr>
    <tr>
      <td>/dados</td>
      <td>Random number 1-6</td>
    </tr>
    <tr>
      <td>/saluda</td>
      <td>Zulma say</td>
    </tr>
    <tr>
      <td>/facha</td>
      <td>Picture beatifull guy</td>
    </tr>
    <tr>
      <td>/esta</td>
      <td>This!!!</td>
    </tr>
    <tr>
      <td>/muere <name></td>
      <td>Cat kill you</td>
    </tr>
    <tr>
      <td>/gay <name></td>
      <td>You're gay and I tell</td>
    </tr>
    <tr>
      <td>/es <closed question></td>
      <td>Make me a closed question and answer you</td>
    </tr>
    <tr>
      <td>/acerca [arg]</td>
      <td>About this bot</td>
    </tr>
  </tbody>
</table>


##Setup

Requires Lua, lua-socket and lua-sec. [dkjson](http://github.com/LuaDist/dkjson/) is provided. Written for Lua 5.2 but will probably run on 5.3.

You must have a Telegram bot and auth token from the [BotFather](http://telegram.me/botfather) to run this bot. telegram-cli is not required.

###Configuration

To begin, copy config.lua.default to config.lua and add the relevant information.

Most config.lua entries are self-explanatory.

Add your bot API key, and other API keys if desirable.
The plugins which require API keys that are not provided are disabled by default.
The provided Giphy key is the public test key, and is subject to rate limitaton.

The "fortune.lua" plugin requires the fortune program to be installed on the host computer.

"time_offset" is the time difference, in seconds, between your system clock. It is sometimes necessary for accurate output of the time plugin.

"admins" table includes the ID numbers, as integers, of any privileged users. These will have access to the admin plugin and any addition privileged commands.

"people" table is for the personality plugin:
`["55994550"] = "topkecleon"`

ID number must be a string. The second string is the nickname to be given to the identified user when a personality greeting is triggered.

To run:

`lua bot.lua`


##Support

Do not private message me for support.

For support for otouto as well as general Lua and bot assistance, please join the [CIS Bot Development](http://telegram.me/joinchat/05fe39f500f8f1b2d1548147a68acd2a) group. After you read the rules and the pastebin, I will assist you there.
