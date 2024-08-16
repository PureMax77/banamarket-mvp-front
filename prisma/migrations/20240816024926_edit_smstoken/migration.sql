/*
  Warnings:

  - You are about to drop the column `isVerified` on the `SMSToken` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_SMSToken" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "phone" INTEGER NOT NULL,
    "count" INTEGER NOT NULL DEFAULT 0,
    "token" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);
INSERT INTO "new_SMSToken" ("count", "created_at", "id", "phone", "token", "updated_at") SELECT "count", "created_at", "id", "phone", "token", "updated_at" FROM "SMSToken";
DROP TABLE "SMSToken";
ALTER TABLE "new_SMSToken" RENAME TO "SMSToken";
CREATE UNIQUE INDEX "SMSToken_phone_key" ON "SMSToken"("phone");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
