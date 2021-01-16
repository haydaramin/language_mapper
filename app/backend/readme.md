## How to use

Run `install.sh`, and [install caddysever](https://caddyserver.com/docs/install). Next run `jruby app.rb` and `caddy reverse-proxy --from example.com --to localhost:4567` in another terminal, replacing example.com with your url.

## API

Language codes are found [here](https://iso639-3.sil.org/code_tables/639/data).

#### /lang/word

Returns a list of possible definitions along with their parts of speech and meaning identifiers. See sample1.js for an example.

#### /lang/word/identifier/translate

Returns a list of translations. See sample2.js for an example



