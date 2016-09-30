require 'pry-byebug'


def pet_shop_name(pet_shop)
  return pet_shop[:name]
end


def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end


def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
  return pet_shop[:admin][:cash]
end


def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end


def increase_pets_sold(pet_shop, number_sold)
  return pet_shop[:admin][:pets_sold] += number_sold
end


def stock_count(pet_shop)
  return pet_shop[:pets].length
end


def pets_by_breed(pet_shop, breed)
  breeds = []
  for pet in pet_shop[:pets]
    breeds.push(pet[:breed]) if pet[:breed] == breed
  end
  return breeds
end


def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    return pet if pet[:name] == name
  end
  return nil
end


def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    pet_shop[:pets].delete(pet) if pet[:name] == name
  end
end


def add_pet_to_stock(pet_shop, new_pet)
  return pet_shop[:pets].push(new_pet)
end


def customer_pet_count(customer)
  return customer[:pets].count
end


def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end


def customer_can_afford_pet(customer, new_pet)
  return true if customer[:cash] >= new_pet[:price]
  return false
end


def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil
    should_sell = customer_can_afford_pet(customer, pet)
    if should_sell == true
      remove_pet_by_name(pet_shop, pet[:name])
      increase_pets_sold(pet_shop, 1)
      add_or_remove_cash(pet_shop, pet[:price])
      add_pet_to_customer(customer, pet)
      customer[:cash] -= pet[:price]
    end
  end
end

