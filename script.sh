contract;

abi Counter {
    #[storage(read, write)]
    fn increment(amount: u64) -> u64;

    #[storage(read, write)]
    fn decrement(amount: u64) -> u64;

    #[storage(read, write)]
    fn reset() -> u64;

    #[storage(read, write)]
    fn set(value: u64) -> u64;

    #[storage(read)]
    fn get() -> u64;

    #[storage(read, write)]
    fn multiply(factor: u64) -> u64;

    #[storage(read, write)]
    fn divide(divisor: u64) -> u64;

    #[storage(read)]
    fn is_greater_than(value: u64) -> bool;

    #[storage(read, write)]
    fn add(value: u64) -> u64;

    #[storage(read, write)]
    fn double() -> u64;

    #[storage(read, write)]
    fn halve() -> u64;

    #[storage(read)]
    fn is_equal_to(value: u64) -> bool;

    #[storage(read, write)]
    fn set_if_less_than(value: u64) -> u64;

    #[storage(read)]
    fn abs() -> u64;

    #[storage(read)]
    fn get_number_one() -> u64;

    #[storage(read)]
    fn get_number_two() -> u64;
}

storage {
    counter: u64 = 0,
}

impl Counter for Contract {
    #[storage(read, write)]
    fn increment(amount: u64) -> u64 {
        let incremented = storage.counter.read() + amount;
        storage.counter.write(incremented);
        incremented
    }

    #[storage(read, write)]
    fn decrement(amount: u64) -> u64 {
        let current_value = storage.counter.read();
        let decremented = if amount > current_value { 0 } else { current_value - amount };
        storage.counter.write(decremented);
        decremented
    }

    #[storage(read, write)]
    fn reset() -> u64 {
        storage.counter.write(0);
        0
    }

    #[storage(read, write)]
    fn set(value: u64) -> u64 {
        storage.counter.write(value);
        value
    }

    #[storage(read)]
    fn get() -> u64 {
        storage.counter.read()
    }

    #[storage(read, write)]
    fn multiply(factor: u64) -> u64 {
        let result = storage.counter.read() * factor;
        storage.counter.write(result);
        result
    }

    #[storage(read, write)]
    fn divide(divisor: u64) -> u64 {
        if divisor == 0 {
            storage.counter.read() 
        } else {
            let result = storage.counter.read() / divisor;
            storage.counter.write(result);
            result
        }
    }

    #[storage(read)]
    fn is_greater_than(value: u64) -> bool {
        storage.counter.read() > value
    }

    #[storage(read, write)]
    fn add(value: u64) -> u64 {
        let result = storage.counter.read() + value;
        storage.counter.write(result);
        result
    }

    #[storage(read, write)]
    fn double() -> u64 {
        let result = storage.counter.read() * 2;
        storage.counter.write(result);
        result
    }

    #[storage(read, write)]
    fn halve() -> u64 {
        let result = storage.counter.read() / 2;
        storage.counter.write(result);
        result
    }

    #[storage(read)]
    fn is_equal_to(value: u64) -> bool {
        storage.counter.read() == value
    }

    #[storage(read, write)]
    fn set_if_less_than(value: u64) -> u64 {
        if storage.counter.read() < value {
            storage.counter.write(value);
            value
        } else {
            storage.counter.read()
        }
    }

    #[storage(read)]
    fn abs() -> u64 {
        storage.counter.read() 
    }

    #[storage(read)]
    fn get_number_one() -> u64 {
        1
    }

    #[storage(read)]
    fn get_number_two() -> u64 {
        2
    }
}
