function onCreate()
    makeAnimatedLuaSprite('NoRegerts', 'GoinPostal/i_regret_nothing', 250, 600);
    addAnimationByPrefix('NoRegerts', '1', 'I regret nothing instancia 1', 24, false);
    setObjectCamera('NoRegerts', 'hud');
    setObjectOrder('NoRegerts', 9999)
    setProperty('NoRegerts.visible', false);
    setProperty('NoRegerts.scale.x', 1.1);
    setProperty('NoRegerts.scale.y', 1.1);
    addLuaSprite('NoRegerts', false);

    precacheImage('GoinPostal/i_regret_nothing');
end

amountOfInstances = 4;

minionTable = {
    ['x'] = {174, 174, 274; n=amountOfInstances},
    ['y'] = {100, 100, 500; n=amountOfInstances}
}

function MinionAppearance(instance)
    if not(instance >= 1 and instance <= amountOfInstances) then
        return;
    end

    if not getProperty('NoRegerts.visible') then
        setProperty('NoRegerts.visible', true);
    end
    setProperty('NoRegerts.x', minionTable['x'][instance]);
    setProperty('NoRegerts.y', minionTable['y'][instance]);
    setProperty('dad.visible', false)
    objectPlayAnimation('NoRegerts', tostring(instance), true);
end

function onEvent(name, value1, value2)
	if name == 'TheFinale' then
        MinionAppearance(tonumber(value1));
    end
end

function onUpdate(elapsed)
    if getProperty('NoRegerts.animation.curAnim.finished') then
        setProperty('NoRegerts.visible', false);
        setProperty('dad.visible', true)
    end
end

