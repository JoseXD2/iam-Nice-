function onCreate()


	
	makeAnimatedLuaSprite('bgtheo', 'characters/theo', -250, -70);
	addAnimationByPrefix('bgtheo', 'idle', 'Theo idle', 12, false);
	scaleObject('bgtheo', 0.8, 0.8);
	setScrollFactor('bgtheo', 0.9, 0.9);
	objectPlayAnimation('bgtheo', 'idle');
	addLuaSprite('bgtheo', false);

		
	makeAnimatedLuaSprite('bgraquel', 'characters/Raquel', 1210, -110);
	addAnimationByPrefix('bgraquel', 'danceLeft', 'Raquel danceLeft', 12, false);
	addAnimationByPrefix('bgraquel', 'danceRight', 'Raquel danceRight', 12, false);
	scaleObject('bgraquel', 0.85, 0.85);
	setScrollFactor('bgraquel', 0.9, 0.9);
	objectPlayAnimation('bgraquel', 'danceRight');
	addLuaSprite('bgraquel', false);
	

	makeAnimatedLuaSprite('bgsis', 'bgsis', 750, -50);
	addAnimationByPrefix('bgsis', 'play', 'bgsis playing', 12, false);
	addAnimationByPrefix('bgsis', 'idle', 'bgsis idle', 12, false);
	addAnimationByPrefix('bgsis', 'gayLeft', 'bgsis gayLeft', 12, false);
	addAnimationByPrefix('bgsis', 'gayRight', 'bgsis gayRight', 12, false);
	addAnimationByPrefix('bgsis', 'danceLeft', 'bgsis danceLeft', 12, false);
	addAnimationByPrefix('bgsis', 'danceRight', 'bgsis danceRight', 12, false);
	scaleObject('bgsis', 0.8, 0.8);
	setScrollFactor('bgsis', 0.9, 0.9);
	objectPlayAnimation('bgsis', 'idle');
	addLuaSprite('bgsis', false);

	makeAnimatedLuaSprite('bgshorty', 'characters/bgshorty', -380, 160);
	addAnimationByPrefix('bgshorty', 'idle', 'bgshorty idle', 12, false);
	scaleObject('bgshorty', 0.75, 0.75);
	setScrollFactor('bgshorty', 0.9, 0.9);
	objectPlayAnimation('bgshorty', 'idle');
	addLuaSprite('bgshorty', false);

fill = 0;
double = 0;
gay = 0;
playing = 0;
sisdance = 0;

end

local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'Leaves');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

--Animation functions

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 1 == 0 then
		objectPlayAnimation('bgshorty', 'idle');
		objectPlayAnimation('bgtheo', 'idle');
		objectPlayAnimation('bgraquel', 'danceRight');

		if gay == 0 then
			if playing == 0 then
				objectPlayAnimation('bgsis', 'idle')
			end
			if playing == 1 then
				if sisdance == 0 then
					objectPlayAnimation('bgsis', 'play')
				end
				if sisdance == 1 then
					objectPlayAnimation('bgsis', 'danceRight')
				end
			end
		end
		if gay == 1 then
			objectPlayAnimation('bgsis', 'gayLeft')
		end
	end
	if curBeat % 2 == 0 then
		objectPlayAnimation('bgraquel', 'danceLeft');
		if gay == 1 then
			objectPlayAnimation('bgsis', 'gayRight')
		end
		if playing == 1 then
			if sisdance == 1 then
				objectPlayAnimation('bgsis', 'danceLeft')
			end
		end
	end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 1 == 0 then
		objectPlayAnimation('bgshorty', 'idle');
		objectPlayAnimation('bgsis', 'idle');
		objectPlayAnimation('bgtheo', 'idle');
		objectPlayAnimation('bgraquel', 'danceRight');
	end
	if counter % 2 == 0 then
		objectPlayAnimation('bgraquel', 'danceLeft');
	end
end

--Mid-song animations

function onStepHit()

	if curStep == 271 then
	playing = 1
end

if curStep == 783 then
sisdance = 1
end

if curStep == 1039 then
sisdance = 0
end

if curStep == 1071 then
playing = 0
end

if curStep == 1103 then
playing = 1
end

if curStep == 1135 then 
playing = 0
end

if curStep == 1167 then
playing = 1
end

if curStep == 1199 then
playing = 0
end

if curStep == 1231 then
playing = 1
end

if curStep == 1263 then
playing = 0
end

if curStep == 1295 then
playing = 1
end

if curStep == 1551 then
playing = 0
end

if curStep == 1615 then
gay = 1
end

if curStep == 1807 then
	gay = 0
	playing = 1 
	sisdance = 1
end


end

--Ending

local allowEnd = false
function onEndSong()
	if not allowEnd and isStoryMode then
		setProperty('inCutscene', true);
		startDialogue('dialogue2', 'Leaves');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end