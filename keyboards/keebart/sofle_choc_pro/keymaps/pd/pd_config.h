#pragma once

#include QMK_KEYBOARD_H

enum layers {
    QWE,
    COL,
    SYM,
    FUN,
};

// QWERTY
#define MTQ_A MT(MOD_LGUI, KC_A)
#define MTQ_S MT(MOD_LALT, KC_S)
#define MTQ_D MT(MOD_LSFT, KC_D)
#define MTQ_F MT(MOD_LCTL, KC_F)

#define MTQ_J MT(MOD_RCTL, KC_J)
#define MTQ_K MT(MOD_RSFT, KC_K)
#define MTQ_L MT(MOD_RALT, KC_L)
#define MTQ_SCLN MT(MOD_RGUI, KC_SCLN)

// COLEMAK_DH
#define MTC_A MT(MOD_LGUI, KC_A)
#define MTC_R MT(MOD_LALT, KC_R)
#define MTC_S MT(MOD_LSFT, KC_S)
#define MTC_T MT(MOD_LCTL, KC_T)

#define MTC_N MT(MOD_RCTL, KC_N)
#define MTC_E MT(MOD_RSFT, KC_E)
#define MTC_I MT(MOD_RALT, KC_I)
#define MTC_O MT(MOD_RGUI, KC_O)
