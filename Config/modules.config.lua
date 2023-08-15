Modules = {}

Modules.DrawMarker = function(id, location, radius, color)

    DrawMarker(
        id, -- Type
        location.x, -- posX
        location.y, -- posY
        location.z -0.98, -- posZ -0.98
        0, -- dirX
        0, -- dirY
        0, -- dirZ
        0, -- rotX
        0, -- rotY
        0, -- rotZ
        radius,
        radius,
        0.15,
        color.r, 
        color.g, 
        color.b, 
        color.a, 
        true,
        true,
        0,
        false,
        nil,
        nil,
        nil
    )

end