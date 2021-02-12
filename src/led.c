#include <avr/io.h>
#include <util/delay.h>

const short LED = 1;

void led_setup(void) {
  DDRB = _BV(LED);
}

void led_on() {
  PORTB ^= _BV(LED);
}

void led_off() {
  PORTB ^= ~_BV(LED);
}

void delay(int ms) {
  // Not the best way to do this, but it does not matter for this example
  for (int i = 0; i < ms; i++) {
    _delay_ms(1);
  }
}
