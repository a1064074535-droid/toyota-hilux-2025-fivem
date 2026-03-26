Locales = {}

-- Arabic
Locales['ar'] = {
      vehicleSpawned = "تم استدعاء السيارة بنجاح",
      vehicleNotFound = "لا توجد سيارة مستدعاة",
      colorChanged = "تم تغيير اللون إلى: %s",
      vehicleFixed = "تم إصلاح السيارة بنجاح",
      vehicleName = "تويوتا هايلوكس 2025",
      vehicleCategory = "سيارات دفع رباعي",
      vehiclePrice = "السعر: $85,000",
      vehicleSpeed = "السرعة القصوى: 180 كم/س"
}

-- English
Locales['en'] = {
      vehicleSpawned = "Vehicle spawned successfully",
      vehicleNotFound = "No vehicle spawned",
      colorChanged = "Color changed to: %s",
      vehicleFixed = "Vehicle fixed successfully",
      vehicleName = "Toyota Hilux 2025",
      vehicleCategory = "Off-Road Vehicles",
      vehiclePrice = "Price: $85,000",
      vehicleSpeed = "Top Speed: 180 km/h"
}

function GetText(key, locale)
      locale = locale or 'ar'
      if Locales[locale] and Locales[locale][key] then
            return Locales[locale][key]
  end
      return key
end
