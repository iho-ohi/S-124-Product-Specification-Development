function NavwarnAreaAffected (feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:15;DisplayPlane:UnderRADAR;PointInstruction:NAVWARNF')
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:15;DisplayPlane:UnderRADAR;PointInstruction:NAVWARNF')
    end
end