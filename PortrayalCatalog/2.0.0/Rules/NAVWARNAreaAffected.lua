function NavwarnAreaAffected (feature, featurePortrayal, contextParameters)
    local viewingGroup
    if feature.PrimitiveType == PrimitiveType.Point then
        viewingGroup = 31020
        featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:15;DisplayPlane:UnderRADAR;PointInstruction:NAVWARNF')

    elseif feature.PrimitiveType == PrimitiveType.Curve then
        viewingGroup = 31020
        featurePortrayal:AddInstructions ('NullInstruction')
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        viewingGroup = 31020
        featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:15;DisplayPlane:UnderRADAR;PointInstruction:NAVWARNF')
    end

    return viewingGroup
end