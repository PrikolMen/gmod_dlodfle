local nextTick = 0
hook.Add("Think", "Dynamic Level of Detail for Lua Entites", function()
    if (nextTick < CurTime()) then
        nextTick = CurTime() + 1
        local ply = LocalPlayer()
        if IsValid( ply ) then
            local pos = ply:EyePos()
            for num, ent in ipairs( ents.GetAll() ) do
                if ent:IsSolid() and ent:IsScripted() then
                    if ent:GetNoDraw() then continue end
                    ent:SetLOD( math.Clamp( math.floor( pos:Distance( ent:GetPos() ) / 100 ), 0, 8 ))
                end
            end
        end
    end
end)