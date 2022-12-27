function onCreate()
    makeAnimatedLuaSprite('deadloser', 'GoinPostal/bf_fuckin_dies', 250, 600);
    addAnimationByPrefix('deadloser', '1', 'BF hit and f*ckin dies instancia 1', 24, false);
    addAnimationByPrefix('deadloser', '2', 'BF deadbody instancia 1', 24, false);
    setProperty('deadloser.visible', false);
    setProperty('deadloser.scale.x', 1);
    setProperty('deadloser.scale.y', 1);
    addLuaSprite('deadloser', true);

    precacheImage('GoinPostal/bf_fuckin_dies');
end

amountOfInstances = 4;

minionTable = {
    ['x'] = {1400, 299, 389; n=amountOfInstances},
    ['y'] = {780, 599, 464; n=amountOfInstances}
}

function MinionAppearance(instance)
    if not(instance >= 1 and instance <= amountOfInstances) then
        return;
    end

    if not getProperty('deadloser.visible') then
        setProperty('deadloser.visible', true);
    end
    setProperty('boyfriend.alpha', 0)
    setProperty('deadloser.x', minionTable['x'][instance]);
    setProperty('deadloser.y', minionTable['y'][instance]);
    objectPlayAnimation('deadloser', tostring(instance), true);
end

function onEvent(name, value1, value2)
	if name == 'bfuckindies' then
        MinionAppearance(tonumber(value1));
    end
end

function onUpdate(elapsed)
    if getProperty('deadloser.animation.curAnim.finished') == true and getProperty('deadloser.animation.curAnim.name') == '2' then
        setProperty('deadloser.visible', false);
        setProperty('boyfriend.alpha', 1)
    end
end

