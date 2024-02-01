-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "residence" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Ancestry" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "surname" TEXT NOT NULL,
    "results" TEXT NOT NULL,
    "generation" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "Ancestry_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Citizenship" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "country" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "Citizenship_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Document" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "type" TEXT NOT NULL,
    "expiration" DATETIME NOT NULL,
    "country" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "citizenshipId" INTEGER NOT NULL,
    CONSTRAINT "Document_citizenshipId_fkey" FOREIGN KEY ("citizenshipId") REFERENCES "Citizenship" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
