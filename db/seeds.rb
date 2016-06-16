@k=Category.create(name: 'Kitchen')
@o=Category.create(name: 'Outdoor')
@b=Category.create(name: 'Bathroom')
@d=Category.create(name: 'Decor')
@e=Category.create(name: 'Entertainment')
User.create(email: 'tanzjacob@gmail.com', password: 'password')
Gift.create(caption: 'Waffle Maker', description: 'We both love waffles', category_id: @k.id, price: 69.99, desired_quantity: 1, remainder_available: 1, website_link: 'http://www.briscoes.co.nz/kitchen/appliances/breville-bwm250-crisp-control-waffle-maker-1058036' )
Gift.create(caption: 'Baking Bowl', description: 'We need a baking bowl for TJ to make cakes', category_id: @k.id, price: 49.99, desired_quantity: 1, remainder_available: 1, website_link: 'http://www.stevens.co.nz/product/Mixing-Bowl-Set/?p=5716856' )
Gift.create(caption: 'PS4', description: 'Iain wants to game more', category_id: @e.id, price: 599.99, desired_quantity: 1, remainder_available: 1, website_link: 'http://shop.jbhifi.co.nz/game/ps4/ps4-playstation-4-1tb-console-black/92302' )
Gift.create(caption: 'Coffee table', description: 'Need a second coffee table', category_id: @d.id, price: 599.99, desired_quantity: 1, remainder_available: 1, website_link: 'http://www.harveynorman.co.nz/furniture/lounge/coffee-and-lamp-tables/stix-coffee-table-by-debonaire-furniture.html' )
Guest.create(first_name: 'Anita', surname: 'Jacob', address: '81 Cold St, Dunedin', email: 'anita@gmail.com')
Guest.create(first_name: 'Genevieve', surname: 'Walker', address: '100 George St, Dunedin', email: 'gen@gmail.com')
