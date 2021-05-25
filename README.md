# Databox Health Cards

Some user study cards relating to possible mental health uses of
[databox](http://www.databoxproject.uk/), using 
[squib](https://github.com/andymeneely/squib/)

By Chris Greenhalgh, 2018
Copyright 2018 The University of Nottingham

## Usage

```
#docker-compose build squib
sudo docker built -t squib .
```
```
sudo docker run --rm -it -v `pwd`:/root/work squib /bin/bash
```
```
ruby deck.rb
```
optional commandline argument for alternative options.yml
(make sure it has all the same stuff as options.yml).

See `options.yml` for config, by default:
- output in _output
- card_00.png
- Altas_0.png
- Atlas is up to 5x3 cards

Note, last card is 'back' by default

