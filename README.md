# Find-A-Dev
Rails app which allows non-technial founders find the perfect developer to bring their vision to the market

### Using Capybara

Place your Capybara specs in `spec/features`, or alternately tag your spec example groups with `type: :feature`, e.g. 

```ruby
describe "the signin process", type: :feature do
	it "signs me in" 
	it "signs me out"
end
```

Use `js: true` tag to use the the javascript driver, selenium by default, e.g.

```ruby
describe 'some stuff which requires js', js: true do
	it 'will use the js driver'
end
```

To use javascript in you Cucumber scenarios, tag your scenarios with the `@javascript` tag.
