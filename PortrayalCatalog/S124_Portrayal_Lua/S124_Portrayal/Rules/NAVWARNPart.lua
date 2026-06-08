function NavwarnPart(feature, featurePortrayal, contextParameters)
    local featureName = GetFeatureName(feature, contextParameters)
    if (featureName) then
        featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:15;DisplayPlane:UnderRADAR;FontColor:CHBLK;LocalOffset:5,0;')
        featurePortrayal:AddTextInstruction(EncodeString(featureName), 26, 24, 31020, 9)
        -- Reset localOffset
        featurePortrayal:AddInstructions('LocalOffset:0,0;')
    end

    if feature.PrimitiveType == PrimitiveType.Point then

        local spatialAssociation = feature:GetSpatialAssociation()
        local associatedFeatures = spatialAssociation:GetAssociatedFeatures()

        if associatedFeatures[1].ID == feature.ID then
            featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:15;DisplayPlane:UnderRADAR;PointInstruction:NAVWARNF')

            if feature.restriction == 1 then
                featurePortrayal:AddInstructions ("PointInstruction:APROXPOS")
            end

            if #associatedFeatures > 1 then
                featurePortrayal:AddInstructions ("ViewingGroup:10;DisplayPlane:UnderRADAR;LocalOffset:0,-2;FontSize:10;FontColor:CHMGD;FontWeight:Medium;FontSlant:Upright;FontProportion:MonoSpaced;TextAlignVertical:Top;TextAlignHorizontal:Center")
                featurePortrayal:AddTextInstruction (tostring (#associatedFeatures), 10, 15, 31020, 15, false)
            end
        else
            featurePortrayal:AddInstructions ("NullInstruction")
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:15;DisplayPlane:OverRADAR;LineInstruction:NAVWARNL')
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:15;DisplayPlane:OverRADAR;PointInstruction:NAVWARNP')

        if feature.restriction == 1 then
            featurePortrayal:AddInstructions ("LineInstruction:NAVWARNL")
        else
            featurePortrayal:SimpleLineStyle('dash',0.64,'CHMGD')
            featurePortrayal:AddInstructions('LineInstruction:_simple_')
        end
    else
        error ('Invalid Primitive')
    end
end