/*
** EPITECH PROJECT, 2023
** Cioccolato
** File description:
** test_main.c
*/

#include "my_program.h"
#include <criterion/criterion.h>
#include <criterion/redirect.h>

void redirect_all_stdout(void)
{
    cr_redirect_stdout();
}

Test(myprogram_suite, test_print_hello_world, .init = redirect_all_stdout)
{
    print_hello_world();
    fflush(stdout);
    cr_assert_stdout_eq_str("Hello, World!\n", "The function should print 'Hello, World!\\n'");
}
