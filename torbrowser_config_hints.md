#### About
  * few hints how to update tor browser torrc configuration file
  * could be useful to route more effectively
#### Usage
  * close tor browser or keep editor open until tor browser is closed tp save file
  * configuration file is at `relative path`
```
joe ./Browser/TorBrowser/Data/Tor/torrc
```
  * optionally add `entry nodes` and set strict to use only specified countries
```
EntryNodes "list of countries here without quotes" StrictNodes 1
```
  * optionally `exlude nodes`
```
ExcludeNodes "list of countries here without quotes" StrictNodes 1
```
  * optionally set specific `exit nodes` and set strict to use only specified countries
  * or set exit nodes to exclude
```
ExitNodes "list of countries here without quotes" StrictNodes 1
```
```
ExcludeExitNodes "list of countries here without quotes" StrictNodes 1
```
  * some `country code examples` for your inspiration
```
# unknown country code
{??}

# you can exclude US or Russia if you do not like the language xDDD
{ru},{us}

# balkan music countries or around xDDD
{gr},{bg},{ro},{hr},{sl},{md}

# some people like or exclude clowns
{ca}

# kingdoms and ursula von unknown
{de},{uk},{se}

# random typing to KB brings this
{hu},{pl},{bz},{ky},{ml},{al},{mt},{ma},{na},{ua},{es},{se},{pa},{py},{ar},{hk},{aw},{bs},{be},{bz},{bm},{ky},{cf},{co},{cd},{cr},{cu},{cy},{do},{eg},{fi}
```
  * finally close tor browser, save file and start browser again
  * To better understand, the final added configuration `./Browser/TorBrowser/Data/Tor/torrc` lines could look for example like this:
```
EntryNodes {de} StrictNodes 1
ExcludeExitNodes {de},{??} StrictNodes 1
ExcludeNodes {us},{ca},{de},{uk},{se},{nl},{??} StrictNodes 1
```
