#ifndef ALIEN_EPOE_H
#define ALIEN_EPOE_H

#include <iostream>
#include "alien/alien.h"

class AlienEpoe : public Alien
{
    public:
        AlienEpoe();
        ptr<Alien> clone() const { return make_ptr<AlienEpoe>(*this); }
        Attack queryAttack(Color   alienColor,
                           Species alienSpecies);
        Move queryMove();
        bool queryEat();
        Color queryColor();
        Species querySpecies();

    private:
};
#endif
