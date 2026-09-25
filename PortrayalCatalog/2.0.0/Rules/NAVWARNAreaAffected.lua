function NavwarnAreaAffected (feature, featurePortrayal, contextParameters)
    local viewingGroup
    if feature.PrimitiveType == PrimitiveType.Point then
        viewingGroup = 31020
        featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:15;DisplayPlane:UnderRADAR;PointInstruction:NAVWARNF')

    elseif feature.PrimitiveType == PrimitiveType.Curve then
        viewingGroup = 31020
        featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:15;DisplayPlane:UnderRADAR;PointInstruction:NAVWARNF')
        featurePortrayal:SimpleLineStyle('dash',0.32,'CHMGD')
        featurePortrayal:AddInstructions('LineInstruction:_simple_')
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        viewingGroup = 31020
        featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:15;DisplayPlane:UnderRADAR;PointInstruction:NAVWARNF')
    end

    return viewingGroup
end