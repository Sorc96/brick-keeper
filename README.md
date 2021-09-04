# Brick Keeper

## Description

Brick Keeper is a basic command line tool for keeping track of LEGO bircks and how much they were bought for.

## Installation

- Clone the repo
- Make sure you have Ruby and SQLite
- cd into the directory
- Run `bundle install` to install Ruby dependencies
- Run `rake db:migrate` to setup the database

## Start

Start Brick Keeper with `ruby brick_keeper.rb`

## Insert manually

Colors and part types are currently accessible only through relations.

Use `db.relations[:colors].insert(name: 'Dark Tan')` to insert a color.

Use `db.relations[:part_types].insert(name: 'Plate 1 x 2')` to insert a part type.

Create a lot manually using `resolve(:lot_repo).create(color_name, part_type_name, quantity, unitprice)`. Unitprice is optional.

## Get info about a part

Use `info(color_name, part_type_name)` to get formatted info about the part printed to the console. Info includes color, part type, total quantity and average price per piece.

Use `find_part(color_name, part_type_name)` to get the full object representing the part.

## Import from BrickLink

- Open the BrickLink order in a web browser
- Run the Javascript in `parse_order.js` in the browser console
- Copy the output of the Javascript from the browser console into Brick Keeper and assign it to a variable
- Run the import with `Import.call(data)`, where `data` is the variable from previous step

Missing colors and part types will be created automatically.
