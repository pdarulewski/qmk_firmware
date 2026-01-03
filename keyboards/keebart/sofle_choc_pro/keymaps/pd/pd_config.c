#include "pd_config.h"
#include QMK_KEYBOARD_H

// set default color to cyan
void keyboard_post_init_user(void) {
    rgb_matrix_enable_noeeprom();
    rgb_matrix_mode_noeeprom(RGB_MATRIX_SOLID_REACTIVE);
}

bool rgb_matrix_indicators_advanced_user(uint8_t led_min, uint8_t led_max) {
    for (uint8_t i = led_min; i < led_max; i++) {
        switch (get_highest_layer(layer_state | default_layer_state)) {
            case QWE:
                rgb_matrix_set_color(i, RGB_MAGENTA);
                break;
            case COL:
                rgb_matrix_set_color(i, RGB_TEAL);
                break;
            case SYM:
                rgb_matrix_set_color(i, RGB_CYAN);
                break;
            case FUN:
                rgb_matrix_set_color(i, RGB_SPRINGGREEN);
                break;
            default:
                break;
        }
    }
    return false;
}
