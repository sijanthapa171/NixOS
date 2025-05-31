"use client";

import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { currentVersion } from "@/lib/routes-config";

export default function VersionManager() {
  return (
    <Select value={currentVersion} onValueChange={() => {}}>
      <SelectTrigger className="sm:w-fit w-full border-none font-code font-medium bg-muted rounded-full text-xs h-8 pl-5">
        <SelectValue placeholder="Version" />
      </SelectTrigger>
      <SelectContent side="bottom" className="font-code">
        <SelectItem value={currentVersion}>
          {currentVersion}
        </SelectItem>
      </SelectContent>
    </Select>
  );
}
