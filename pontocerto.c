#include <stdio.h>

int pontosEmDobro(int p) {
    return p * 2;
}

int bonus50(int p) {
    return p + 50;
}

int calculaPontos(int (*regra)(int), int valor) {
    return regra(valor);
}

int acumula(int (*primeira)(int), int (*segunda)(int), int valor) {
    return segunda(primeira(valor));
}

int main(void) {
    printf("%d\n", calculaPontos(pontosEmDobro, 80));
    printf("%d\n", calculaPontos(bonus50, 80));
    printf("%d\n", acumula(pontosEmDobro, bonus50, 100));
    printf("%d\n", acumula(bonus50, pontosEmDobro, 100));
    return 0;
}
