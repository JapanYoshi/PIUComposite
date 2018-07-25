-- starting point generously provided by TaroNuke here:
-- https://www.reddit.com/r/Stepmania/comments/7vkvwv/total_n00b_question_move_playfield_left_for_one/dtt8xd6/

-- create and return an object capable of running code
return Def.ActorFrame{
    OnCommand=function(self)
		-- For experimentation purposes, let's make the x value a variable.
		local xDisplacement = SCREEN_HEIGHT * -0.2;
	
		-- Once the ActorFrame is created, this script will check for players on screen, and put it into a list.
        local players = {}

        -- This bit will either find the playfield or return a nil value.
        local p0 = SCREENMAN:GetTopScreen():GetChild('Player')
		local p1 = SCREENMAN:GetTopScreen():GetChild('PlayerP1')
        local p2 = SCREENMAN:GetTopScreen():GetChild('PlayerP2')

        -- This bit will add the playfield into the list, only if it has been found.
		if p0 then table.insert(players,p0); end
        if p1 then table.insert(players,p1); end
        if p2 then table.insert(players,p2); end

		-- This applies the effect in the playfield(s) in the list.
        for i=1,#players do
			players[i]:linear(0.5);
            players[i]:addx(xDisplacement);-- Set the x value
			if SCREEN_WIDTH / SCREEN_HEIGHT < 1.5 then
				players[i]:zoom(0.8);
				players[i]:addy(SCREEN_HEIGHT * 0.05);
			end
			-- In case future me wants to add extra effects, here's where you add them, future me.
        end

    end;

    --This quad keeps the FGCHANGE active; otherwise it would stop being in effect as soon as the final command is done.
    Def.Quad{
        OnCommand=cmd(sleep,1000);
    };
}